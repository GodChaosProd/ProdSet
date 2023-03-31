function init(virtual)
  if not virtual then
    self.detectArea = config.getParameter("detectArea")
  end
end

function update(dt)
	-- Vore Chat Handler
	local players = world.entityQuery(object.position(), 6, {
      includedTypes = {"player"},
      boundMode = "CollisionArea"
	})
	-- Animation Handler
	state = animator.animationState("bodyState")
	
    -- animator.setAnimationState("bodyState", "blink")
	-- animator.animationState

	if math.random(300) == 1 and state == "idle" then
		animator.setAnimationState("bodyState", "open")
	elseif math.random(300) == 1 and state == "idleopen" then
		animator.setAnimationState("bodyState", "gush")
	elseif math.random(300) == 1 and state == "idleopen" then
		animator.setAnimationState("bodyState", "jam")
	elseif math.random(900) == 1 and state == "idleopen" then
		animator.setAnimationState("bodyState", "close")
	end
	
	end