local active_border_color = "rgb(e7d88a)"
local inactive_border_color = "rgba(4f5b4777)"
local shadow_color = "rgba(58a66f55)"

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 2,
    shadow = {
      enabled = true,
      range = 10,
      render_power = 3,
      color = shadow_color,
      color_inactive = "rgba(00000044)",
    },
  },
})
