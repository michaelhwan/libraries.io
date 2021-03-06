require 'rails_helper'

describe GithubOrganisation do
  it { should have_many(:github_repositories) }
  it { should have_many(:source_github_repositories) }
  it { should have_many(:open_source_github_repositories) }
  it { should have_many(:dependencies) }
  it { should have_many(:favourite_projects) }
  it { should have_many(:contributors) }
  it { should have_many(:projects) }

  it { should validate_uniqueness_of(:login) }
  it { should validate_uniqueness_of(:github_id) }
end
