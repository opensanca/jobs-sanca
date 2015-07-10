Meteor.methods

  createJob: (data) ->
    throw new Meteor.Error(401, 'Você precisa estar logado!' ) unless Meteor.userId()
    data.userId = Meteor.userId()
    data.createdAt = new Date()
    Jobs.insert data

  updateJob: (id, data) ->
    throw new Meteor.Error(401, 'Você precisa estar logado!' ) unless Meteor.userId()
    data.updatedAt = new Date()
    Jobs.update id,
      $set: data

  deleteJob: (id) ->
    throw new Meteor.Error(401, 'Você precisa estar logado!' ) unless Meteor.userId()
    Jobs.remove id
