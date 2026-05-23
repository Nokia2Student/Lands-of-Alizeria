// Enhanced Lighting System - Улучшенная система освещения с визуальными эффектами
// Обязательный инклюд для констант освещения
#include "../../game/objects/lighting/_base_light.dm"

// ===== ЧАСТЬ 1: РАСШИРЕННЫЕ СВЕТИЛЬНИКИ =====

/obj/machinery/light/improved
	name = "улучшенный светильник"
	desc = "Светильник с оптимизированным освещением и лучшей визуализацией."
	brightness = 11
	var/improved_light_power = 1.3
	var/improved_falloff = 2.3
	var/use_enhanced_visuals = TRUE
	var/glow_layer_count = 3

/obj/machinery/light/improved/Initialize(mapload)
	. = ..()
	if(on && status == LIGHT_OK)
		set_light(brightness, light_inner_range, improved_light_power, improved_falloff, bulb_colour)

/obj/machinery/light/improved/update_icon()
	cut_overlays()
	switch(status)
		if(LIGHT_OK)
			if(emergency_mode)
				icon_state = "[base_state]_emergency"
				icon_state = null
			else
				icon_state = "[base_state]"
				icon_state = null
				if(on)
					// Основной слой свечения
					var/mutable_appearance/main_glow = mutable_appearance(overlayicon, base_state, ABOVE_LIGHTING_LAYER, ABOVE_LIGHTING_PLANE)
					main_glow.alpha = CLAMP(improved_light_power * 250, 60, 240)
					main_glow.color = bulb_colour
					add_overlay(main_glow)

					// Второй слой для глубины
					var/mutable_appearance/layer2_glow = mutable_appearance(overlayicon, base_state, ABOVE_LIGHTING_LAYER, ABOVE_LIGHTING_PLANE)
					layer2_glow.alpha = CLAMP(improved_light_power * 130, 30, 160)
					layer2_glow.color = bulb_colour
					layer2_glow.transform = matrix(1.1, 0, 0, 0, 1.1, 0)
					add_overlay(layer2_glow)

					// Третий слой для дополнительной глубины
					var/mutable_appearance/layer3_glow = mutable_appearance(overlayicon, base_state, ABOVE_LIGHTING_LAYER, ABOVE_LIGHTING_PLANE)
					layer3_glow.alpha = CLAMP(improved_light_power * 70, 15, 100)
					layer3_glow.color = bulb_colour
					layer3_glow.transform = matrix(1.2, 0, 0, 0, 1.2, 0)
					add_overlay(layer3_glow)
		if(LIGHT_EMPTY)
			icon_state = "[base_state]-empty"
		if(LIGHT_BURNED)
			icon_state = "[base_state]-burned"
		if(LIGHT_BROKEN)
			icon_state = "[base_state]-broken"
	return

// ===== ЧАСТЬ 2: ДИНАМИЧЕСКИЕ ЭФФЕКТЫ =====

// Светильник с мерцающим пламенем (для факелов)
/obj/machinery/light/dynamic_torch
	name = "динамический факел"
	desc = "Факел с мерцающим пламенем и реалистичным свечением."
	icon = 'icons/obj/lighting.dmi'
	base_state = "torch"
	icon_state = "torch"
	brightness = 7
	bulb_colour = "#FAA019"  // Теплый оранжево-жёлтый цвет пламени
	var/flame_intensity = 1.0
	var/flame_variance = 2
	var/torch_light_power = 1.1
	var/is_processing = FALSE

/obj/machinery/light/dynamic_torch/Initialize(mapload)
	. = ..()
	if(on && status == LIGHT_OK)
		is_processing = TRUE
		START_PROCESSING(SSobj, src)

/obj/machinery/light/dynamic_torch/process()
	if(!on || QDELETED(src) || status != LIGHT_OK)
		return PROCESS_KILL

	// Динамическое мерцание пламени
	var/variance = rand(-flame_variance, flame_variance)
	var/dynamic_brightness = CLAMP(brightness + variance, max(1, brightness - flame_variance), brightness + flame_variance)
	var/dynamic_power = CLAMP(torch_light_power * (1.0 + variance * 0.05), 0.8, 1.4)

	set_light(dynamic_brightness, light_inner_range, dynamic_power, 2.4, bulb_colour)
	update_icon()

/obj/machinery/light/dynamic_torch/update_icon()
	cut_overlays()
	switch(status)
		if(LIGHT_OK)
			if(on)
				icon_state = "[base_state]1"
				// Динамический оверлей мерцания
				var/mutable_appearance/flame = mutable_appearance(overlayicon, base_state, ABOVE_LIGHTING_LAYER, ABOVE_LIGHTING_PLANE)
				flame.alpha = CLAMP(torch_light_power * 220, 80, 255)
				flame.color = bulb_colour
				add_overlay(flame)

				// Второй слой для глубины
				var/mutable_appearance/flame2 = mutable_appearance(overlayicon, base_state, ABOVE_LIGHTING_LAYER, ABOVE_LIGHTING_PLANE)
				flame2.alpha = CLAMP(torch_light_power * 120, 40, 180)
				flame2.color = bulb_colour
				flame2.transform = matrix(1.08, 0, 0, 0, 1.08, 0)
				add_overlay(flame2)
			else
				icon_state = "[base_state]0"
		if(LIGHT_EMPTY)
			icon_state = "[base_state]-empty"
		if(LIGHT_BURNED)
			icon_state = "[base_state]-burned"
		if(LIGHT_BROKEN)
			icon_state = "[base_state]-broken"

/obj/machinery/light/dynamic_torch/Destroy()
	is_processing = FALSE
	return ..()

// Светильник с пульсирующим магическим светом
/obj/machinery/light/magical_pulsing
	name = "магический светильник"
	desc = "Магический источник света с плавно пульсирующим свечением."
	icon = 'icons/obj/lighting.dmi'
	base_state = "magic_orb"
	icon_state = "magic_orb"
	brightness = 8
	bulb_colour = "#9B51FF"  // Лавандово-фиолетовый цвет
	var/pulse_min = 0.6
	var/pulse_max = 1.6
	var/pulse_current = 1.0
	var/pulse_direction = 0.05
	var/is_pulsing = FALSE

/obj/machinery/light/magical_pulsing/Initialize(mapload)
	. = ..()
	if(on && status == LIGHT_OK)
		is_pulsing = TRUE
		START_PROCESSING(SSobj, src)

/obj/machinery/light/magical_pulsing/process()
	if(!on || QDELETED(src) || status != LIGHT_OK)
		return PROCESS_KILL

	// Плавная пульсация магического света
	pulse_current += pulse_direction
	if(pulse_current >= pulse_max)
		pulse_direction = -0.05
	else if(pulse_current <= pulse_min)
		pulse_direction = 0.05

	set_light(brightness, light_inner_range, pulse_current, 2.6, bulb_colour)
	update_icon()

/obj/machinery/light/magical_pulsing/update_icon()
	cut_overlays()
	switch(status)
		if(LIGHT_OK)
			if(on)
				icon_state = "[base_state]"

				// Основной пульсирующий слой
				var/mutable_appearance/pulse = mutable_appearance(overlayicon, base_state, ABOVE_LIGHTING_LAYER, ABOVE_LIGHTING_PLANE)
				pulse.alpha = CLAMP(pulse_current * 210, 60, 255)
				pulse.color = bulb_colour
				add_overlay(pulse)

				// Внешний слой с задержкой для эффекта излучения
				var/mutable_appearance/pulse_outer = mutable_appearance(overlayicon, base_state, ABOVE_LIGHTING_LAYER, ABOVE_LIGHTING_PLANE)
				pulse_outer.alpha = CLAMP(pulse_current * 120, 30, 180)
				pulse_outer.color = bulb_colour
				pulse_outer.transform = matrix(1.15, 0, 0, 0, 1.15, 0)
				add_overlay(pulse_outer)
			else
				icon_state = "[base_state]-off"
		if(LIGHT_EMPTY)
			icon_state = "[base_state]-empty"
		if(LIGHT_BURNED)
			icon_state = "[base_state]-burned"
		if(LIGHT_BROKEN)
			icon_state = "[base_state]-broken"

/obj/machinery/light/magical_pulsing/Destroy()
	is_pulsing = FALSE
	return ..()

// ===== ЧАСТЬ 3: ГЛОБАЛЬНЫЕ УЛУЧШЕНИЯ =====

// Расширение базового светильника для поддержки улучшенной визуализации
/obj/machinery/light/proc/enable_enhanced_overlays()
	/// Включает многослойные оверлеи свечения для текущего светильника
	update_icon()

/atom/proc/set_light_enhanced(l_outer_range, l_inner_range, l_power, l_falloff_curve = 2.5, l_color = "#FFFFFF", l_on = TRUE)
	/// Улучшенная версия set_light с оптимизированными параметрами
	set_light(l_outer_range, l_inner_range, l_power, l_falloff_curve, l_color, l_on)

// Система повышения качества визуализации
/proc/apply_enhanced_lighting_to_all_lights()
	/// Применяет улучшенную визуализацию ко всем существующим светильникам на карте
	/// Должна быть вызвана после загрузки карты
	for(var/obj/machinery/light/light in world)
		if(!QDELETED(light))
			light.enable_enhanced_overlays()

// ===== КОНСТАНТЫ ДЛЯ ОПТИМИЗАЦИИ =====
#define ENHANCED_LIGHT_FALLOFF 2.5
#define ENHANCED_LIGHT_POWER_MULTIPLIER 1.2
#define ENHANCED_LIGHT_RANGE_MULTIPLIER 1.1
#define DYNAMIC_FLICKER_SPEED 2
#define DYNAMIC_FLICKER_VARIANCE 3
#define MAGIC_PULSE_SPEED 0.05
#define MAGIC_PULSE_MIN 0.6
#define MAGIC_PULSE_MAX 1.6
