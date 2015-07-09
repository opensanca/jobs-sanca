Router.route '/jobs/new', ->
  @layout 'layout'
  @render 'jobsNew'

Template.jobsNewContent.onRendered ->
  @$(".summernote").summernote
    type: 'summernote'
    height: 300
    minHeight: 300
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'italic', 'underline', 'clear']],
      ['para', ['ul', 'ol']],
      ['insert', ['link','hr']]
    ]
    styleWithSpan: false

Template.jobsNewContent.events

  'click .btn-save': (event, template) ->
    title = template.$("#title")
    if _.isEmpty title.val()
      bootbox.alert "Campo precisa ser preenchido!"
      title.closest(".form-group").addClass 'has-error'
      return
    term = template.$("#term")
    if _.isEmpty term.val()
      bootbox.alert "Campo precisa ser preenchido!"
      term.closest(".form-group").addClass 'has-error'
      return
    company = template.$("#company")
    description = template.$("#description")
    if _.isEmpty term.code()
      bootbox.alert "Campo precisa ser preenchido!"
      description.closest(".form-group").addClass 'has-error'
      return
    Meteor.call 'createJob',
      title: title.val()
      term: term.val()
      company: company.val()
      description: description.code()
    , (err) ->
      if err
        bootbox.aler "Houve um erro ao salvar o anúncio"
      else
        $.bootstrapGrowl "O anúncio foi salvo", type: 'success'
        Router.go '/'

  'focus :input': (event, template) ->
    $(event.target).closest(".form-group").removeClass 'has-error'

Template.jobsNewForbidden.events
  "click .btn-linkedin": (event, template) ->
    Meteor.loginWithLinkedIn()
