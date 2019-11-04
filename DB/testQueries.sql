use ITAMSports
Select * from Deporte
Select * from Evento
Select * from Equipo
SELECT TOP (10) Deporte.nombre as Deporte, 
				Evento.fecha as Fecha, 
				Evento.hora as Hora, 
				Evento.descripcion as Descripción 
FROM Evento, Deporte 
WHERE Evento.fecha > GETDATE() AND Evento.idDep = Deporte.idDep

SELECT Equipo.nombre as Equipo,
	   Deporte.nombre as Deporte,
	   Equipo.jugados as 'Partidos Juagdos',
	   Equipo.ganados as 'Partidos Ganados',
	   Equipo.perdidos as 'Partidos Perdidos'
FROM Equipo, Deporte
WHERE Equipo.idDep = Deporte.idDep