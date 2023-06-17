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

	if #players == 0 and state == "idle" then
		animator.setAnimationState("bodyState", "fold")
		animator.playSound("squish")
	end
	
	if #players > 0 and state == "idlefold" then
		animator.setAnimationState("bodyState", "open")
		animator.playSound("squish")
	end

	if math.random(300) == 1 and state == "idle" then
		animator.setAnimationState("bodyState", "inflate")
	elseif math.random(300) == 1 and state == "idle" then
		animator.setAnimationState("bodyState", "gush")
	elseif math.random(300) == 1 and state == "idle" then
		animator.setAnimationState("bodyState", "squeeze")
	end
end