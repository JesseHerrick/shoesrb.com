---
---

# initialize instantclick
InstantClick.init();

# get GitHub API data
loadContributors = (github) ->
  contributors = github
  list = $ '#contributors'

  for contributor in contributors
    username = contributor.login
    avatar = contributor.avatar_url
    contributions = contributor.contributions

    list.append("<li><a href=\"https://github.com/#{username}/\"><img class=\"contrib-avatar\" src=\"#{avatar}\"><a href=\"https://github.com/#{username}/\">#{username}</a> (#{contributions})</li>")

$.getJSON 'https://api.github.com/repos/shoes/shoes4/contributors', (data) -> loadContributors(data)
