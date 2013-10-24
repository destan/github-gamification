module Authentication
  module ActiveRecordHelpers

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def find_for_oauth(auth)
        record = where(provider: auth.provider, uid: auth.uid.to_s).first
        user = record || create(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20])
        create_github_account(auth, user) if record.nil?
        user
      end


      def create_github_account(auth,user)
        github_acc = GithubAccount.new
        github_acc.login = auth.extra.raw_info.login
        github_acc.github_id = auth.extra.raw_info.id
        github_acc.token = auth.credentials.token
        github_acc.user = user
        github_acc.save
      end
    end
  end
end