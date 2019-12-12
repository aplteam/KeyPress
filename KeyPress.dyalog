:Namespace KeyPress ⍝ V2.0
⍝ 1995 04 03 RexSwain: Independent Consultant, Tel (+1) 203-868-0131
⍝ 1995 08 15 RexSwain: Simplify and improve handling of System and APL fonts
⍝ 2017 03 02 MBaas: Initial code for KP as UCMD
⍝ 2017 03 09 MBaas: Runs in classic, using 4 digits for hex-codes in non-classic, easy BCol-Fiddling
⍝ 2017 03 10 MBaas: Adjustments to positioning, colour and fonts
⍝ 2017 03 15 Adam: Shorten printed labels, add spacing, adjust fonts, spin off thread if called from session, help text fixes
⍝ 2017 03 16 Adam: Fix help level ?? → ?, remove outputted newline, fix RIU issue
⍝ 2017 03 22 Adam: Made colours consistent
⍝ 2017 09 04 Kai: Pressing <escape> or <Alt+F4> twice closes the dialog box; no threads needed by moving logic to a callback; honour scaling
⍝ 2017 10 02 MBaas: more help; honouring scaling by using ScaledPixel
⍝ 2018 04 18 Adam: ]??cmd → ]cmd -??
⍝ 2018 04 19 Adam: help text updates
⍝ 2018 05 01 Adam: add SVN tag
⍝ 2019 01 16 Adam: help
⍝ 2019 02 14 Andy: replace http with https
⍝ 2019 12 11 Kai: Make it a stand-alone EXE in order to avoid any conflicts whith Accelerators defined anywahere in ⎕SE

    BCol_Form←¯16   ⍝ = Button Face      188 188 188      ⍝ background of the form
    BCol_Label←¯16  ⍝ = Button Face      166 166 166     ⍝ labels for the various fields
    BCol_Result←¯21 ⍝ = Button Highlight 208 208 208    ⍝ interpreted elements of the message
    BCol_RawMsg←¯21 ⍝ = Button Highlight 208 208 208    ⍝ the event message    (original col was 127 255 255)

    DESC←'Return message arguments of KeyPress events'

    ⎕IO←1 ⋄ ⎕ML←1

    ∇ r←List
      :If ⎕SE.SALTUtils.WIN
          r←⎕NS ⍬
          r.Name←'KeyPress'
          r.Group←'MSWIN'
          r.Desc←DESC
          r.Parse←''
      :Else
          r←⍬
      :EndIf
    ∇

    ∇ r←level Help Cmd;h
      r←DESC('    ]',Cmd)''
      :If 0<level
          h←'Displays GUI and waits for KeyPress events. '
          h,←'Whenever the event is triggered (i.e. a key is pressed), it displays the arguments. '
          r,←h''
          r,←⊂'Keypress event information includes the key number for a particular key. This is needed when:'
          r,←⊂' ∘  setting up an Accelerator property for a GUI object.'
          r,←⊂' ∘  editing the keyboard translate .DIN files for the IME to enable keyboard layout customisation.'      
		  r,←⊂' ∘  performing some action in the keypress event callback for a particular key.'
		  r,←⊂''
		  r,←⊂'Note that this runs as a stand-alone EXE in order to avoid that Accelerator keys defined in ⎕SE'
		  r,←⊂'would not be reported as they take precedence.'
		  r,←⊂''
          r,←⊂'For more information on the event message vector, see the Dyalog for Microsoft Windows Object Reference Guide:'
          h←'    ]Open https://help.dyalog.com/'
          h,←1↓∊2↑'.'(=⊂⊢)'.',2⊃⎕SE.SALTUtils.APLV
          h,←'/Content/GUI/MethodOrEvents/KeyPress.htm'
          r,←h'' 'Thanks to Rex Swain, Independent Consultant, who wrote the first version of this utility.'
      :Else
          r,←⊂']',Cmd,' -?? ⍝ for more information'
      :EndIf
    ∇

    ∇ {R}←Run dummy;path;wsh
      R←⍬
      path←(⊃⎕NPARTS ##.SourceFile),'KeyPress.dws'
      :If ⎕NEXISTS path
          'wsh'⎕WC'OLEClient' 'WScript.Shell'
          {}wsh.Run ⊂path
      :Else
          ⎕←'Could not find KeyPress.dws in ',⊃⎕NPARTS path
      :EndIf
    ∇
	
	∇ {r}←{parms}StartAPL workspace;cl;quote;cmd;wsh
	⍝ ⍵ ←→ workspace
	⍝ ⍺ ←→ additional stuff for the command line like maxws=nn etc.
	parms←{0<⎕NC ⍵:≡⍵ ⋄ ''}'parms'
	cl←2 ⎕NQ #'GetCommandLineArgs'
	quote←{'"',⍵,'"'}
	cmd←quote⊃cl
	cmd,←' 'quote workspace
	cmd,←{0=≡⍵:⍵ ⋄ ' ',⍵}parms
	'wsh'⎕WC'OLEClient' 'WScript.Shell'
	wsh.Run⊂cmd
    ⍝Done
   ∇

:EndNamespace ⍝ KeyPress
