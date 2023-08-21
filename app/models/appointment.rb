class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :appointment_date, presence: true
  validate :validate_appointment_datetime

  def validate_appointment_datetime
    if appointment_date < Time.now
      errors.add(:appointment_date,"must be in the future")
    end
    if overlaps_with_existing_appointments?
      errors.add(:base, "Appointment conflicts with existing appointments")
    end
  end

  def overlaps_with_existing_appointments?
    conflicting_appointments = Appointment.where("id != ? AND apppointment_date BETWEEN ? AND ?",id || 0,appointment_date-1.hour,appointment_date+1.hour)
    conflicting_appointments.exists?
  end
end
