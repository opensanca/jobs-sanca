Meteor.methods
  createJob: (data) ->
    data.createdAt = new Date()
    Jobs.insert data
