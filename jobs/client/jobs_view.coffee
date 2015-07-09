Router.route '/jobs/view/:id', ->
  @layout 'layout'
  @subscribe 'job', @params.id
  @render 'jobsView', data:
    id: @params.id


Template.jobsView.helpers

  job: ->
    Jobs.findOne(@id)

Template.jobsViewContent.helpers

  author: ->
    Meteor.users.findOne(@userId)

  fromNow: ->
    moment.locale('pt-br')
    moment(@createdAt).fromNow()

Template.jobsViewContent.events