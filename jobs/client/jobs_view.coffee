Router.route '/jobs/view/:id', ->
  @layout 'layout'
  @render 'jobsView', data:
    id: @params.id

Template.jobsView.onCreated ->
  @subscribe 'job', @data.id

Template.jobsView.helpers
  job: ->
    Jobs.findOne(@id)

Template.jobsViewContent.helpers

  author: ->
    Meteor.users.findOne(@userId)

  fromNow: ->
    moment(@createdAt).fromNow()

  belongsToUser: ->
    ((Meteor.userId() is @userId))

Template.jobsViewContent.events
