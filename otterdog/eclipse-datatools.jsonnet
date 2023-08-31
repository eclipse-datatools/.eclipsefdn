local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-datatools') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/tools.datatools",
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Provides extensible frameworks and exemplary tools focused on data-centric technologies.",
    email: "dtp-dev@eclipse.org",
    members_can_change_project_visibility: false,
    name: "Eclipse Data Tools Platform",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/datatools/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('datatools') {
      default_branch: "master",
      has_discussions: true,
      web_commit_signoff_required: false,
    },
  ],
}
