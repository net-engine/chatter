#=require messages

describe "Messages", ->
  it "it has a #user_1 div", ->
    loadFixtures "online_users"
    content = $("#user_1").html()
    expect(content).toMatch('demo')

  it "removeOnlineStatusFor removes #user_1 div", ->
    loadFixtures "online_users"
    user =
      id: 1
    removeOnlineStatusFor(user)
    content = $("#user_1").html()
    expect(content).not.toMatch('demo')
