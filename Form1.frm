VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4740
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5385
   LinkTopic       =   "Form1"
   ScaleHeight     =   316
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   359
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ProgressBar bar1 
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   4440
      Width           =   5175
      _ExtentX        =   9128
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save File"
      Height          =   255
      Left            =   1800
      TabIndex        =   1
      Top             =   4080
      Width           =   1695
   End
   Begin VB.PictureBox Picture1 
      Height          =   4020
      Left            =   0
      Picture         =   "Form1.frx":0000
      ScaleHeight     =   264
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   352
      TabIndex        =   0
      Top             =   0
      Width           =   5340
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
On Error Resume Next
Dim a As String
Dim start, finish As Long
bar1.Max = Picture1.ScaleHeight
start = Timer
Dim b As Integer

Open "c:\save.mat" For Output As 1
Print #1, Picture1.ScaleWidth & ", " & Picture1.ScaleHeight
For y = 0 To Picture1.ScaleHeight - 1
bar1.Value = bar1.Value + 1
For i = 0 To Picture1.ScaleWidth - 1


'a = GetPixel(Picture1.hdc, i, y) & ", " & i & ", " & y


restart:
For gx = 1 To Picture1.ScaleWidth - 1 Step 1
DoEvents
If GetPixel(Picture1.hdc, i, y) <> GetPixel(Picture1.hdc, i + gx, y) Then
Print #1, "(" & i & ", " & y & ")-(" & i + gx - 1&; ", " & y & "), " & GetPixel(Picture1.hdc, i, y)
i = i + gx
GoTo restart
End If
Next gx




Next i
Next y
finish = Timer
MsgBox "encoded in " & finish - start
bar1.Value = 0
Close 1
End Sub

Private Sub Command3_Click()

End Sub

Private Sub Command2_Click()

End Sub
