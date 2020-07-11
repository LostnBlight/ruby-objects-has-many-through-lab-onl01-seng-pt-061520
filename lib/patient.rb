class Patient
  attr_accessor :name
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @@all << self
  end  
  
  def appointments
    Appointment.all.select {|appt| appt.patient == self}
  end
  
  def doctors
    appointments.map {|appt| appt.doctor}
  end
  
  def new_appointment(date, docter)
    Appointment.new(date, self, doctor)
  end
end