--- generate a chord from one input 

-- in1: pitch cv input
-- in2: choose scale -- not yet

-- outputs 1-3 chord root, 3rd, 5th
-- output 4 pulse on chord change or 7th...still unsure


scales =
{ octave = {0}
, chroma = {} -- this is a shortcut
, major  = {0,2,4,5,7,9,11}
, harMin = {0,2,3,5,7,8,10}
, dorian = {0,2,3,5,7,9,10}
, majTri = {0,4,7}
, dom7th = {0,4,7,10}
, wholet = {0,2,4,6,8,10}
}

-- update quantizer
input[1].scale = function(s)
  output[1].volts = s.volts -- root note
	output[2].volts = s.volts + (4/12) -- 3rd
	output[3].volts = s.volts + (7/12) -- 5th
	output[4].volts = s.volts + (11/12) -- 7th
  -- output[4]() -- fire pulse
end

randomScale = scales[math.random( #scales )]
dyn{scale=randomScale}
	
function redo()
	input[1].mode('scale', sc)
	output[2].scale = scale
	output[3].scale = scale
	output[4].scale = scale
end


function init()
	-- input[1].mode('scale',public.scale)
	input[1].mode('scale', scale)
	output[2].scale = scale
	output[3].scale = scale
	output[4].scale = scale -- output 4 as cv
	-- output[4].action = pulse(0.01, 8) -- output 4 as trigger
	-- output 4 arpeggiator?
end
