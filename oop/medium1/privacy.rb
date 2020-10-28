class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  # to_s method added for testing/experimentation
  def to_s
    switch.to_s
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
puts machine
machine.start
puts machine
machine.stop
puts machine
machine.flip_switch('error')
puts machine