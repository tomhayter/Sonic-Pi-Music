use_bpm 140

a = ring(75,70,67)
b = ring(73,70,65)
c = ring(72,68,65)

live_loop :melody do
  use_synth :piano
  d = 0
  8.times do
    play a[d], sustain: 2, sustain_level: 1, release: 2
    sleep 0.5
    d=d+1
  end
  2.times do
    d = 0
    8.times do
      play b[d], sustain: 2, sustain_level: 1, release: 2
      sleep 0.5
      d=d+1
    end
  end
  d = 0
  8.times do
    play c[d], sustain: 2, sustain_level: 1, release: 2
    sleep 0.5
    d=d+1
  end
end

e = ring(63,58,55)
f = ring(61,58,53)
g = ring(60,56,53)
h = ring(e,f,f,g)

live_loop :chords do
  sync :melody
  use_synth :piano
  i=0
  3.times do
    play h[i], sustain: 4, sustain_level: 2, release: 2, amp: 3
    sleep 4
    i = i+1
  end
  play h[3], sustain: 4, sustain_level: 2, release: 2, amp: 3
  
end