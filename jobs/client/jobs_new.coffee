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
    if _.isEmpty title.val().trim()
      bootbox.alert "O título precisa ser preenchido!"
      title.closest(".form-group").addClass 'has-error'
      return

    term = template.$("#term")
    if _.isEmpty term.val().trim()
      bootbox.alert "O tipo precisa ser escolhido!"
      term.closest(".form-group").addClass 'has-error'
      return

    company = template.$("#company")
    if _.isEmpty company.val().trim()
      bootbox.alert "A empresa precisa ser preenchida!"
      company.closest(".form-group").addClass 'has-error'
      return

    email = template.$("#email")
    if _.isEmpty email.val().trim()
      bootbox.alert "O email precisa ser preenchida!"
      email.closest(".form-group").addClass 'has-error'
      return
    unless (/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i).test email.val()
      bootbox.alert "Por favor, entre com um emai válido!"
      email.closest(".form-group").addClass 'has-error'
      return

    description = template.$("#description")
    if _.isEmpty $(description.code()).text().trim()
      bootbox.alert "A descrição precisa ser preenchida!"
      description.closest(".form-group").addClass 'has-error'
      return

    Meteor.call 'createJob',
      title: title.val().trim()
      term: term.val().trim()
      company: company.val().trim()
      email: email.val().trim()
      description: description.code()
    , (err) ->
      if err
        bootbox.alet "Ops! Houve um erro ao salvar o anúncio."
      else
        $.bootstrapGrowl "O anúncio foi salvo", type: 'success'
        Router.go '/'

  'focus :input': (event, template) ->
    $(event.target).closest(".form-group").removeClass 'has-error'

Template.jobsNewForbidden.events
  "click .btn-linkedin": (event, template) ->
    Meteor.loginWithLinkedIn()
