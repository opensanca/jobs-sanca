Router.route '/jobs/edit/:id', ->
  @layout 'layout'
  @render 'jobsEdit', data:
    id: @params.id

Template.jobsEdit.onCreated ->
  @subscribe 'job', @data.id

Template.jobsEdit.helpers
  job: ->
    Jobs.findOne(@id)

Template.jobsEditContent.helpers
  belongsToUser: ->
    ((Meteor.userId() is @userId))

Template.jobsEditContent.events

  'click .btn-save': (event, template) ->
    data = Template.jobsForm.getData(template)
    return unless data
    Meteor.call 'updateJob', @data._id, data
    , (err) ->
      if err
        bootbox.alet "Ops! Houve um erro ao salvar o anúncio."
      else
        $.bootstrapGrowl "O anúncio foi salvo", type: 'success'
        Router.go '/'

  'click .btn-remove': (event, template) ->
    bootbox.confirm "Tem certeza que deseja remover o anúncio '#{@data.title}'?", (result) =>
      if result
        Meteor.call 'deleteJob', @data._id
        , (err) ->
          if err
            bootbox.alet "Ops! Houve um erro ao remover o anúncio."
          else
            $.bootstrapGrowl "O anúncio foi removido", type: 'success'
            Router.go '/'

Template.jobsEditForbidden.events
  "click .btn-linkedin": (event, template) ->
    Meteor.loginWithLinkedIn()
