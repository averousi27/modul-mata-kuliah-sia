package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import com.sia.main.domain.RPPerTemu;

public interface RPPerTemuRepository {

	public void update(RPPerTemu rpPerTemu);

	public UUID insert(RPPerTemu rpPerTemu);

	public RPPerTemu findById(UUID idRPPerTemu);

	public RPPerTemu findByRP(UUID idRP);

}
