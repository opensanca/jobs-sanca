Template.navbar.events

  "click .btn-linkedin": (event, template) ->
    Meteor.loginWithLinkedIn()

  "click .btn-logout": (event, template) ->
    Meteor.logout()

Template.registerHelper "isEqual", (a, b) ->
  _.isEqual a, b
