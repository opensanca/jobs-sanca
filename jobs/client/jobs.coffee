Router.route '/jobs', ->
  @layout 'layout'
  @render 'jobs'


Template.jobs.onCreated ->
  @subscribe 'jobs'

Template.jobsContent.helpers

  jobs: ->
    Jobs.find({} , {sort: {createdAt: -1}})

  author: ->
    Meteor.users.findOne(@userId)

  fromNow: ->
    moment.locale('pt-br')
    moment(@createdAt).fromNow()

  belongsToUser: ->
    ((Meteor.userId() is @userId))
