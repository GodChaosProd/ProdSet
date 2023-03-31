function init()
  animator.setParticleEmitterOffsetRegion("drips", mcontroller.boundBox())
  animator.setParticleEmitterActive("drips", true)

  effect.setParentDirectives("fade=ddfedd=0.1")
end

function update(dt)

end

function uninit()
  
end
