require 'test_helper'

class CommitFilesControllerTest < ActionController::TestCase
  setup do
    @commit_file = commit_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commit_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commit_file" do
    assert_difference('CommitFile.count') do
      post :create, commit_file: { additions: @commit_file.additions, changed_lines: @commit_file.changed_lines, commit_id: @commit_file.commit_id, deletions: @commit_file.deletions, filename: @commit_file.filename }
    end

    assert_redirected_to commit_file_path(assigns(:commit_file))
  end

  test "should show commit_file" do
    get :show, id: @commit_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commit_file
    assert_response :success
  end

  test "should update commit_file" do
    patch :update, id: @commit_file, commit_file: { additions: @commit_file.additions, changed_lines: @commit_file.changed_lines, commit_id: @commit_file.commit_id, deletions: @commit_file.deletions, filename: @commit_file.filename }
    assert_redirected_to commit_file_path(assigns(:commit_file))
  end

  test "should destroy commit_file" do
    assert_difference('CommitFile.count', -1) do
      delete :destroy, id: @commit_file
    end

    assert_redirected_to commit_files_path
  end
end
