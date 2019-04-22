workflow "Echo Workflow" {
  on = "push"
  resolves = ["Echo"]
}

action "BranchCheck" {
  uses = "actions/bin/filter@master"
  args = "branch develop"
}

action "merged-filter" {
  uses = "actions/bin/filter@master"
  args = "merged true"
#  needs = ["BranchCheck"]
}

action "Echo" {
  uses = "actions/bin/sh@master"
  env = {
    MESSAGE = "Hello World"
  }
  args = ["echo === $MESSAGE. SHA:$GITHUB_SHA, REF:$GITHUB_REF, WORKFLOW:$GITHUB_WORKFLOW, ACTION:$GITHUB_ACTION, ACTOR:$GITHUB_ACTOR, REPOSITORY:$GITHUB_REPOSITORY, EVENT_NAME:$GITHUB_EVENT_NAME, EVENT_PATH:$GITHUB_EVENT_PATH, WORKSPACE:$GITHUB_WORKSPACE, HOME:$HOME"]
  needs = ["BranchCheck"]
}
