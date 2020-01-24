/*
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 //  http://github.com/bartoszswiety/GITHubclient
 */

import Foundation
struct GitProject: Codable {
    let id: Int
    let node_id: String
    let name: String
    let full_name: String
    let owner: GitUser?
    let html_url: String
    let description: String
    let fork: Bool
    let url: String
    let forks_url: String

    let collaborators_url: String
    let teams_url: String
    let hooks_url: String
    let issue_events_url: String
    let events_url: String
    let assignees_url: String
    let branches_url: String
    let tags_url: String
    let blobs_url: String
    let git_tags_url: String
    let git_refs_url: String
    let trees_url: String
    let statuses_url: String
    let languages_url: String
    let stargazers_url: String
    let contributors_url: String
    let subscribers_url: String
    let subscription_url: String
    let commits_url: String
    let git_commits_url: String
    let comments_url: String
    let issue_comment_url: String
    let contents_url: String
    let compare_url: String
    let merges_url: String
    let archive_url: String
    let downloads_url: String
    let issues_url: String
    let pulls_url: String
    let milestones_url: String
    let notifications_url: String
    let labels_url: String
    let releases_url: String
    let deployments_url: String
    let created_at: String
    let updated_at: String
    let pushed_at: String
    let git_url: String
    let ssh_url: String
    let clone_url: String
    let svn_url: String
    let homepage: String
    let size: Int
    let stargazers_count: Int
    let watchers_count: Int
    let language: String
    let has_issues: Bool
    let has_projects: Bool
    let has_downloads: Bool
    let has_wiki: Bool
    let has_pages: Bool
    let forks_count: Int
    let mirror_url: String
    let archived: Bool
    let disabled: Bool
    let open_issues_count: Int
//    let license: License
    let forks: Int
    let open_issues: Int
    let watchers: Int
    let default_branch: String
    let score: Double

    var contriubutors: [GitUser] = []

    enum CodingKeys: String, CodingKey {
        case id
        case node_id
        case name
        case full_name

        case owner
        case html_url
        case description
        case fork
        case url
        case forks_url

        case collaborators_url
        case teams_url
        case hooks_url
        case issue_events_url
        case events_url
        case assignees_url
        case branches_url
        case tags_url
        case blobs_url
        case git_tags_url
        case git_refs_url
        case trees_url
        case statuses_url
        case languages_url
        case stargazers_url
        case contributors_url
        case subscribers_url
        case subscription_url
        case commits_url
        case git_commits_url
        case comments_url
        case issue_comment_url
        case contents_url
        case compare_url
        case merges_url
        case archive_url
        case downloads_url
        case issues_url
        case pulls_url
        case milestones_url
        case notifications_url
        case labels_url
        case releases_url
        case deployments_url
        case created_at
        case updated_at
        case pushed_at
        case git_url
        case ssh_url
        case clone_url
        case svn_url
        case homepage
        case size
        case stargazers_count
        case watchers_count
        case language
        case has_issues
        case has_projects
        case has_downloads
        case has_wiki
        case has_pages
        case forks_count
        case mirror_url
        case archived
        case disabled
        case open_issues_count
//        case license = "license"
        case forks
        case open_issues
        case watchers
        case default_branch
        case score
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        node_id = try values.decodeIfPresent(String.self, forKey: .node_id) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        full_name = try values.decodeIfPresent(String.self, forKey: .full_name) ?? ""

        owner = try values.decodeIfPresent(GitUser.self, forKey: .owner)
        html_url = try values.decodeIfPresent(String.self, forKey: .html_url) ?? ""
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        fork = try values.decodeIfPresent(Bool.self, forKey: .fork) ?? false
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        forks_url = try values.decodeIfPresent(String.self, forKey: .forks_url) ?? ""

        collaborators_url = try values.decodeIfPresent(String.self, forKey: .collaborators_url) ?? ""
        teams_url = try values.decodeIfPresent(String.self, forKey: .teams_url) ?? ""
        hooks_url = try values.decodeIfPresent(String.self, forKey: .hooks_url) ?? ""
        issue_events_url = try values.decodeIfPresent(String.self, forKey: .issue_events_url) ?? ""
        events_url = try values.decodeIfPresent(String.self, forKey: .events_url) ?? ""
        assignees_url = try values.decodeIfPresent(String.self, forKey: .assignees_url) ?? ""
        branches_url = try values.decodeIfPresent(String.self, forKey: .branches_url) ?? ""
        tags_url = try values.decodeIfPresent(String.self, forKey: .tags_url) ?? ""
        blobs_url = try values.decodeIfPresent(String.self, forKey: .blobs_url) ?? ""
        git_tags_url = try values.decodeIfPresent(String.self, forKey: .git_tags_url) ?? ""
        git_refs_url = try values.decodeIfPresent(String.self, forKey: .git_refs_url) ?? ""
        trees_url = try values.decodeIfPresent(String.self, forKey: .trees_url) ?? ""
        statuses_url = try values.decodeIfPresent(String.self, forKey: .statuses_url) ?? ""
        languages_url = try values.decodeIfPresent(String.self, forKey: .languages_url) ?? ""
        stargazers_url = try values.decodeIfPresent(String.self, forKey: .stargazers_url) ?? ""
        contributors_url = try values.decodeIfPresent(String.self, forKey: .contributors_url) ?? ""
        subscribers_url = try values.decodeIfPresent(String.self, forKey: .subscribers_url) ?? ""
        subscription_url = try values.decodeIfPresent(String.self, forKey: .subscription_url) ?? ""
        commits_url = try values.decodeIfPresent(String.self, forKey: .commits_url) ?? ""
        git_commits_url = try values.decodeIfPresent(String.self, forKey: .git_commits_url) ?? ""
        comments_url = try values.decodeIfPresent(String.self, forKey: .comments_url) ?? ""
        issue_comment_url = try values.decodeIfPresent(String.self, forKey: .issue_comment_url) ?? ""
        contents_url = try values.decodeIfPresent(String.self, forKey: .contents_url) ?? ""
        compare_url = try values.decodeIfPresent(String.self, forKey: .compare_url) ?? ""
        merges_url = try values.decodeIfPresent(String.self, forKey: .merges_url) ?? ""
        archive_url = try values.decodeIfPresent(String.self, forKey: .archive_url) ?? ""
        downloads_url = try values.decodeIfPresent(String.self, forKey: .downloads_url) ?? ""
        issues_url = try values.decodeIfPresent(String.self, forKey: .issues_url) ?? ""
        pulls_url = try values.decodeIfPresent(String.self, forKey: .pulls_url) ?? ""
        milestones_url = try values.decodeIfPresent(String.self, forKey: .milestones_url) ?? ""
        notifications_url = try values.decodeIfPresent(String.self, forKey: .notifications_url) ?? ""
        labels_url = try values.decodeIfPresent(String.self, forKey: .labels_url) ?? ""
        releases_url = try values.decodeIfPresent(String.self, forKey: .releases_url) ?? ""
        deployments_url = try values.decodeIfPresent(String.self, forKey: .deployments_url) ?? ""
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        pushed_at = try values.decodeIfPresent(String.self, forKey: .pushed_at) ?? ""
        git_url = try values.decodeIfPresent(String.self, forKey: .git_url) ?? ""
        ssh_url = try values.decodeIfPresent(String.self, forKey: .ssh_url) ?? ""
        clone_url = try values.decodeIfPresent(String.self, forKey: .clone_url) ?? ""
        svn_url = try values.decodeIfPresent(String.self, forKey: .svn_url) ?? ""
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage) ?? ""
        size = try values.decodeIfPresent(Int.self, forKey: .size) ?? 0
        stargazers_count = try values.decodeIfPresent(Int.self, forKey: .stargazers_count) ?? 0
        watchers_count = try values.decodeIfPresent(Int.self, forKey: .watchers_count) ?? 0
        language = try values.decodeIfPresent(String.self, forKey: .language) ?? ""
        has_issues = try values.decodeIfPresent(Bool.self, forKey: .has_issues) ?? false
        has_projects = try values.decodeIfPresent(Bool.self, forKey: .has_projects) ?? false
        has_downloads = try values.decodeIfPresent(Bool.self, forKey: .has_downloads) ?? false
        has_wiki = try values.decodeIfPresent(Bool.self, forKey: .has_wiki) ?? false
        has_pages = try values.decodeIfPresent(Bool.self, forKey: .has_pages) ?? false
        forks_count = try values.decodeIfPresent(Int.self, forKey: .forks_count) ?? 0
        mirror_url = try values.decodeIfPresent(String.self, forKey: .mirror_url) ?? ""
        archived = try values.decodeIfPresent(Bool.self, forKey: .archived) ?? false
        disabled = try values.decodeIfPresent(Bool.self, forKey: .disabled) ?? false
        open_issues_count = try values.decodeIfPresent(Int.self, forKey: .open_issues_count) ?? 0
//        license = try values.decodeIfPresent(License.self, forKey: .license)
        forks = try values.decodeIfPresent(Int.self, forKey: .forks) ?? 0
        open_issues = try values.decodeIfPresent(Int.self, forKey: .open_issues) ?? 0
        watchers = try values.decodeIfPresent(Int.self, forKey: .watchers) ?? 0
        default_branch = try values.decodeIfPresent(String.self, forKey: .default_branch) ?? ""
        score = try values.decodeIfPresent(Double.self, forKey: .score) ?? 0
    }
}
