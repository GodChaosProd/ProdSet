function init()

  script.setUpdateDelta(5)

  self.healingRate = 2.5 / config.getParameter("healTime", 60)
end

function update(dt)
  status.modifyResourcePercentage("health", self.healingRate * dt)
end

function uninit()
end

function onExpire()
	status.addEphemeralEffect("juicesoaked")
end