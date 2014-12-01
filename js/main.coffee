---
---

# initialize instantclick
InstantClick.init();

# get GitHub API data
loadContributors = (github) ->
  contributors = github
  team = $ '#contributors'
  team_members = contributors.length
  groups = team_members / 5

  for group in [1..groups]
    team.append("<div class='grid group#{group}'></div>")

  for contributor, index in contributors
    username = contributor.login
    avatar = contributor.avatar_url
    contributions = contributor.contributions
    team_member = "<div class='unit one-fifth'><img src='#{avatar}'><h4><a href='http://github.com/#{username}' target='_blank'>#{username}</a> (#{contributions})</h4></div>"

    index += 1
    group_number = Math.ceil(index / 5)

    $(".group#{group_number}").append(team_member)

$.getJSON 'https://api.github.com/repos/shoes/shoes4/contributors', (data) -> loadContributors(data)
