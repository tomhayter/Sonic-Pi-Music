use_bpm 120

a = ring(73,78)
b = ring(75,80)
c = ring(76,81)

d = ring(a,b,c,b)


live_loop :kick do
  4.times do
    sample :drum_bass_hard
    sleep 1
  end
end

live_loop :hat do
  sync :kick
  7.times do
    sample :drum_cymbal_closed
    sleep 0.5
  end
  sample :drum_cymbal_closed
end

live_loop :bass do
  sync :kick
  use_synth :piano
  7.times do
    play ring(54,49,52,54,52,49,47).tick
    sleep 0.5
  end
  play 49
end

live_loop :chords do
  sync :kick
  use_synth :piano
  play d.tick, amp: 2
  sleep 1.5
  play d.tick, amp: 2
  sleep 2.5
  play d.tick, amp: 2
  sleep 1.5
  play d.tick, amp: 2
  sleep 2.49
end