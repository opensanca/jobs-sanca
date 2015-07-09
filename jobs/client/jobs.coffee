Router.route '/jobs', ->
  @layout 'layout'
  @render 'jobs'

  @subscribe 'jobs'

Template.jobs.helpers
  jobs: ->
    Jobs.find()
