Meteor.publish 'jobs', ->
  #Meteor._sleepForMs(2000)
  @relations
      collection: Jobs
      options:
        fields:
          title: 1
          company: 1
          userId: 1
          term: 1
          createdAt: 1
      mappings:[
        foreign_key: "userId"
        collection: Meteor.users
        options:
          fields:
            'profile.firstName': 1
            'profile.lastName': 1
            'profile.pictureUrl': 1
      ]
  @ready()


Meteor.publish 'job', (id) ->
  #Meteor._sleepForMs(2000)
  [
    Jobs.find {_id: id},
      fields:
        title: 1
        description: 1
        email: 1
        company: 1
        userId: 1
        term: 1
        createdAt: 1
  ,
    Meteor.users.find {_id: Jobs.findOne(id).userId},
      fields:
        'profile.firstName': 1
        'profile.lastName': 1
        'profile.pictureUrl': 1
  ]
