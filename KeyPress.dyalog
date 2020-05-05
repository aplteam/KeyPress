:Namespace KeyPress ⍝v2.0.1
⍝ Kai's version: started in 2019-12 because Dyalog's version interferred with ⎕SE and therefore was not reliable.
⍝ It's now a stand-alone EXE which does not interfere with anything.
⍝ 2020 03 25 ⋄ kai ⋄ 2.0.1
⍝ * APL session waited for the call to return. It should not of course.
⍝ 2020 02 13 ⋄ kai ⋄ 2.0
⍝ * First stand-alone version

    BCol_Form←¯16   ⍝ = Button Face      188 188 188    ⍝ background of the form
    BCol_Label←¯16  ⍝ = Button Face      166 166 166    ⍝ labels for the various fields
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
          r,←⊂'Note that this runs as a stand-alone EXE in order to avoid that Accelerator keys alsodefined in ⎕SE'
          r,←⊂'are not reported as those on ⎕SE take precedence.'
          r,←⊂''
          r,←⊂'For more information on the event message vector, see the Dyalog for Microsoft Windows Object Reference Guide:'
          h←'    ]Open https://help.dyalog.com/'
          h,←1↓∊2↑'.'(=⊂⊢)'.',2⊃⎕SE.SALTUtils.APLV
          h,←'/Content/GUI/MethodOrEvents/KeyPress.htm'
          r,←h'' 'Thanks to Rex Swain, Independent Consultant, who implemented the first version of this utility.'
      :Else
          r,←⊂']',Cmd,' -?? ⍝ for more information'
      :EndIf
    ∇

    ∇ {R}←Run dummy;path
      R←⍬
      path←(2 ⎕nq #'GetEnvironment' 'USERPROFILE'),'\Documents\MyUCMDs\KeyPress\KeyPress.exe'
      :If ⎕NEXISTS path
         ⎕SH path ''
      :Else
          11 ⎕SIGNAL⍨'Could not find ',path
      :EndIf
    ∇

:EndNamespace