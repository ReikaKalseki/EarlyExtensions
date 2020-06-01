data:extend(
{
  {
    type = "technology",
    name = "steam-power",
    icon = "__EarlyExtensions__/graphics/technology/steam-power.png",
    icon_size = 128,
    effects =
    {

    },
    prerequisites =
    {
      
    },
    unit =
    {
      count = 10,
      ingredients =
      {
        {"early-science-pack", 1},
      },
      time = 20
    },
    order = "c-k-b-a",
  },
  {
    type = "technology",
    name = "electric-machinery",
    icon = "__EarlyExtensions__/graphics/technology/electric-machines.png",
    icon_size = 128,
    effects =
    {

    },
    prerequisites =
    {
      "steam-power"
    },
    unit =
    {
      count = 20,
      ingredients =
      {
        {"early-science-pack", 1},
      },
      time = 20
    },
    order = "c-k-b-a",
  },
  {
    type = "technology",
    name = "basic-science",
    icon = "__EarlyExtensions__/graphics/technology/basic-science.png",
    icon_size = 128,
    effects =
    {

    },
    prerequisites =
    {
      "electric-machinery"
    },
    unit =
    {
      count = 30,
      ingredients =
      {
        {"early-science-pack", 1},
      },
      time = 20
    },
    order = "c-k-b-a",
  },
}
)





