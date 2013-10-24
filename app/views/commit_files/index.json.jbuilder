json.array!(@commit_files) do |commit_file|
  json.extract! commit_file, :filename, :additions, :deletions, :changed_lines, :commit_id
  json.url commit_file_url(commit_file, format: :json)
end
