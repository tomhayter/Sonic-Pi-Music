use_bpm 120

#        1 2 3 4 5 6 7 8 9 10 11 12
r = ring(1,0,0,1,0,1,1,0,0,1 ,0 ,1 )
k = ring(0,0,1,0,0,1,0,0,1,0 ,0 ,1 )
s = ring(0,0,0,1,0,1,0,0,0,1 ,0 ,0 )

#            1 2 3 4 5 6 7 8 9 10 11 12
fill1 = ring(1,0,1,1,1,0,1,0,1,1 ,1 ,0 )
fill2 = ring(1,0,1,0,1,0,1,0,0,1 ,0 ,0 )
fill3 = ring(0,0,0,1,0,0,0,0,0,1 ,0 ,0 )
fill4 = ring(0,1,1,0,1,1,0,1,1,1 ,0 ,0 )

cs = chord(:c4, :M7)
ds = chord(:d4, :M7)
as = chord(:as4, :M7)
prog = ring(cs,ds,cs,ds,cs,ds,as,as)

time = ring(1,0.66666666,0.33333333,0.16666666)
dmaj = scale(:d4, :major, num_octaves: 2.5)
diff = ring(-2,-1,0,1,2)
num = 7

improv = 0


a=0
live_loop :kick do
  12.times do
    if k[a] == 1
      sample :drum_bass_soft
    end
    a = a+1
    sleep 0.33333333
  end
end

b=0
live_loop :ride do
  sync :kick
  11.times do
    if r[b] == 1
      sample :drum_cymbal_soft
    end
    b = b+1
    sleep 0.33333333
  end
  if r[b] == 1
    sample :drum_cymbal_soft
  end
  b = b+1
  sleep 0.3
end

c=0
live_loop :snare do
  sync :kick
  7.times do
    c=0
    12.times do
      if s[c] == 1
        sample :drum_snare_soft, amp: 3
      end
      c=c+1
      sleep 0.33333333
    end
  end
  f = ring(fill1,fill2,fill3,fill4).choose
  11.times do
    if f[c] == 1
      sample :drum_snare_soft, amp: 3
    end
    c=c+1
    sleep 0.33333333
  end
  c=c+1
  sample :drum_cymbal_open
end

live_loop :hat do
  sync:kick
  11.times do
    sample :drum_cymbal_closed, amp: 0.6
    sleep 0.33333333
  end
  sample :drum_cymbal_closed, amp: 0.6
end



live_loop :piano do
  sync :kick
  use_synth :piano
  no =  rrand(0,1)
  print improv
  if improv == 2 or improv == 3 or improv == 5 or improv == 6
    sleep 2
  else
    if no > 0.8
      4.times do
        num = num + diff.choose
        print num
        sleep time.choose
        play dmaj[num], sustain: 5, release: 5
      end
    else if no > 0.3
      6.times do
        num = num + diff.choose
        print num
        sleep time.choose
        play dmaj[num], sustain: 5, release: 5
      end
    else
      8.times do
        num = num + diff.choose
        print num
        sleep time.choose
        play dmaj[num], sustain: 5, release: 5
      end
    end
  end
end
end


live_loop :bass do
  sync :kick
  with_fx :lpf, cutoff: 60 do
    use_synth :chipbass
    use_synth_defaults release: 0.3, amp: 1
    3.times do
      play_pattern_timed chord(:c2, :M7), 1
      play_pattern_timed chord(:d2, :M7), 1
    end
    play_pattern_timed chord(:as1, :M7), 1
    play_pattern_timed chord(:as1, :M7), 0.99
    improv += 1
  end
end

live_loop :chords do
  sync :kick
  with_fx :reverb, room: 0.7 do
    use_synth :piano
    play prog.tick, sustain: 4, release: 2, amp: 3
    sleep 2
  end
end