


equipment = {
  drum_kit: {
    brand: "Pearl",
    model: "Crystal Beat",
    pieces: [
      "Floor tom",
      "Kick",
      "Snare",
      "Hi-hat",
      "Crash-ride"
    ]
  },
  guitar_amp: {
    brand: "Sunn",
    mode: "100s",
    year: 1969,
    controls: {
      "Volume" => 11,
      "Treble" => 7,
      "Bass" => 6,
      "Contour" => 5,
      "Rate" => 7,
      "Depth" => 3,
      "Reverb" => 5,
      "Standby" => false,
      "Polarity" => "Down",
      "Power" => true
    }

  },
  electric_guitar: {
    brand: "Fender",
    model: "Mustang",
    year: 1965,
    strings: 6,
    tuning: "EADGBE",
    color: "blue"
  },

  pedals: {
    reverb:{
      brand: "Electro Harmonix",
      model: "Holy Grail Reverb",
      controls:{
        "Footswitch" => true,
        "Reverb" => 4,
        "Type" => "Flerb"
      },
      type_options: [
        "Spring",
        "Hall",
        "Flerb"
      ]
      },
    fuzz:{
      brand: "Electro Harmonix",
      model: "Big Muff",
      controls:{
        "Volume" => 10,
        "Sustain" => 10,
        "Tone" => 10,
        "Footswitch" => true
      }
    }
  }
}

puts equipment[:guitar_amp][:controls]["Standby"]
puts equipment[:pedals][:fuzz][:controls]
puts equipment[:electric_guitar][:tuning]
equipment[:electric_guitar][:tuning] = "DADGAD"
puts equipment[:electric_guitar][:tuning]