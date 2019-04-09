workflow "Echo" {
  on = "push"
  resolves = ["BranchCheck", "Echo"]
}

action "BranchCheck" {
  uses = "actions/bin/filter@master"
  args = "branch develop"
}

action "Echo" {
  uses = "actions/bin/sh@master"
  env = {
    MESSAGE = "Hello World"
  }
  args = ["echo $MESSAGE"]
  needs = ["BranchCheck"]
}
