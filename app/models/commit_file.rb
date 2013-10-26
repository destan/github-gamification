class CommitFile < ActiveRecord::Base
  belongs_to :commit

  validates :filename, uniqueness: {scope: "commit_id"}

  after_save :calculate_point


  def calculate_point
    extension = File.extname(self.filename)
    language = Language.where("extensions LIKE ?", "%#{extension}%").first if extension.present?

    if language.present?
      point = language.ratio * self.changed_lines if self.changed_lines.present? && language.ratio.present? #TODO this will be changed
      commit_point = CommitPoint.find_by_commit_id_and_language_id(self.commit_id, language.id)
      if commit_point.present?
        commit_point.point += point
      else
        commit_point = CommitPoint.new
        commit_point.commit = self.commit
        commit_point.language = language
        commit_point.point = point
      end
      commit_point.save
    end

  end
end
