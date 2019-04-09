workflow "Echo" {
  on = "push"
  resolves = ["Echo"]
}

action "Is develop branch" {
  uses = "actions/bin/filter@master"
  args = "branch develop"
}

action "Echo" {
  uses = "actions/bin/sh@master"
  args = ["echo 'HELLO'"]
  needs = ["Is develop branch"]
}
