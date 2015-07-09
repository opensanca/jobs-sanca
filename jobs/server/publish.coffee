Meteor.publish 'jobs', ->
  Jobs.find()
