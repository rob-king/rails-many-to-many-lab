class AppointmentsController < ApplicationController
  def index
    @appointments =  Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    #@doctors =  Doctor.all.map { |doctor| [doctor.id, doctor.name]  }
    @doctors = Doctor.all
    @patients =  Patient.all
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    @appointment.save
    redirect_to appointment_path(@appointment)

  end

  def edit
    @doctors = Doctor.all
    @patients =  Patient.all
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id)
  end
end
