Router.route '/jobs', ->
  @layout 'layout'
  @render 'jobs'
  @subscribe 'jobs'

Template.jobs.helpers

  jobs: ->
    Jobs.find({} , {sort: {createdAt: -1}})

  author: ->
    Meteor.users.findOne(@userId)

  fromNow: ->
    moment.locale('pt-br')
    moment(@createdAt).fromNow()
