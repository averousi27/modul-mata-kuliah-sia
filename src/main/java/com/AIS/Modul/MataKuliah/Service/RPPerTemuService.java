package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import com.sia.main.domain.RPPerTemu;

public interface RPPerTemuService {

	public String save(RPPerTemu rpPerTemu);

	public String delete(UUID uuid);

}
