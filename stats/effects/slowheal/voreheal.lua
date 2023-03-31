function init()

  script.setUpdateDelta(5)

  self.healingRate = 1.0 / config.getParameter("healTime", 60)
end

function update(dt)
  status.modifyResourcePercentage("health", self.healingRate * dt)
end

function onExpire()
	status.addEphemeralEffect("ps_droolsoaked")
end

function uninit()
end