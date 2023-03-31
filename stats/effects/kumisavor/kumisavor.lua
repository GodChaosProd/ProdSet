function init()
  self.digestRate = -(1.0 / 175)
end

function update(dt)
	if status.resourcePercentage("health") > 0.02 then
		status.modifyResourcePercentage("health", self.digestRate * dt)
	end
end

function uninit()
	if status.resourcePercentage("health") <= 0.02 then
		status.modifyResourcePercentage( "health", -0.03 )
	end
--	sb.logInfo("savor ending")
end

function onExpire()
	status.addEphemeralEffect("ps_droolsoaked")
end