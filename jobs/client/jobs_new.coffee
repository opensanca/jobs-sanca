Router.route '/jobs/new', ->
  @layout 'layout'
  @render 'jobsNew'


Template.jobsNewContent.events

  'click .btn-save': (event, template) ->

    data = Template.jobsForm.getData(template)
    return unless data
    Meteor.call 'createJob', data
    , (err) ->
      if err
        bootbox.alet "Ops! Houve um erro ao salvar o anúncio."
      else
        $.bootstrapGrowl "O anúncio foi salvo", type: 'success'
        Router.go '/'

Template.jobsNewForbidden.events
  "click .btn-linkedin": (event, template) ->
    Meteor.loginWithLinkedIn()
