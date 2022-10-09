use_bpm 120

a = ring(65,72)
b = ring(65,73)
c = ring(63,72)
d = ring(63,70)

e = ring(a,b,c,d)

live_loop :chords do
  f = e.tick
  use_synth :piano
  play f, release: 5, amp: 2, sustain: 2, sustain_level: 2
  sleep 1.5
  play f, release: 5, amp: 2, sustain: 2, sustain_level: 2
  sleep 1.5
  play f, release: 5, amp: 2, sustain: 2, sustain_level: 2
  sleep 1
end

g = ring(49,44,51,53)

live_loop :bass do
  sync :chords
  use_synth :piano
  play g.tick, release: 5, amp: 0.5, sustain: 2, sustain_level: 2
end