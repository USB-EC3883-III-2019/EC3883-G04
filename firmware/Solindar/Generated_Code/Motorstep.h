/* ###################################################################
**     THIS COMPONENT MODULE IS GENERATED BY THE TOOL. DO NOT MODIFY IT.
**     Filename    : Motorstep.h
**     Project     : Solindar
**     Processor   : MC9S08QE128CLK
**     Component   : BitsIO
**     Version     : Component 02.108, Driver 03.28, CPU db: 3.00.067
**     Compiler    : CodeWarrior HCS08 C Compiler
**     Date/Time   : 2019-10-16, 12:27, # CodeGen: 15
**     Abstract    :
**         This component "BitsIO" implements a multi-bit input/output.
**         It uses selected pins of one 1-bit to 8-bit port.
**     Settings    :
**         Port name                   : PTD
**
**         Bit mask of the port        : $00F0
**         Number of bits/pins         : 4
**         Single bit numbers          : 0 to 3
**         Values range                : 0 to 15
**
**         Initial direction           : Output (direction can be changed)
**         Safe mode                   : yes
**         Initial output value        : 0 = 000H
**         Initial pull option         : off
**
**         Port data register          : PTDD      [$0006]
**         Port control register       : PTDDD     [$0007]
**
**             ----------------------------------------------------
**                   Bit     |   Pin   |   Name
**             ----------------------------------------------------
**                    0      |    56   |   PTD4_KBI2P4
**                    1      |    28   |   PTD5_KBI2P5
**                    2      |    27   |   PTD6_KBI2P6
**                    3      |    26   |   PTD7_KBI2P7
**             ----------------------------------------------------
**
**         Optimization for            : speed
**     Contents    :
**         GetDir - bool Motorstep_GetDir(void);
**         SetDir - void Motorstep_SetDir(bool Dir);
**         GetVal - byte Motorstep_GetVal(void);
**         PutVal - void Motorstep_PutVal(byte Val);
**         GetBit - bool Motorstep_GetBit(byte Bit);
**         PutBit - void Motorstep_PutBit(byte Bit, bool Val);
**         SetBit - void Motorstep_SetBit(byte Bit);
**         ClrBit - void Motorstep_ClrBit(byte Bit);
**         NegBit - void Motorstep_NegBit(byte Bit);
**
**     Copyright : 1997 - 2014 Freescale Semiconductor, Inc. 
**     All Rights Reserved.
**     
**     Redistribution and use in source and binary forms, with or without modification,
**     are permitted provided that the following conditions are met:
**     
**     o Redistributions of source code must retain the above copyright notice, this list
**       of conditions and the following disclaimer.
**     
**     o Redistributions in binary form must reproduce the above copyright notice, this
**       list of conditions and the following disclaimer in the documentation and/or
**       other materials provided with the distribution.
**     
**     o Neither the name of Freescale Semiconductor, Inc. nor the names of its
**       contributors may be used to endorse or promote products derived from this
**       software without specific prior written permission.
**     
**     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
**     ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
**     WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
**     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
**     ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
**     (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
**     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
**     ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
**     (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
**     SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**     
**     http: www.freescale.com
**     mail: support@freescale.com
** ###################################################################*/
/*!
** @file Motorstep.h
** @version 03.28
** @brief
**         This component "BitsIO" implements a multi-bit input/output.
**         It uses selected pins of one 1-bit to 8-bit port.
*/         
/*!
**  @addtogroup Motorstep_module Motorstep module documentation
**  @{
*/         

#ifndef Motorstep_H_
#define Motorstep_H_

/* MODULE Motorstep. */

  /* Including shared modules, which are used in the whole project */
#include "PE_Types.h"
#include "PE_Error.h"
#include "PE_Const.h"
#include "IO_Map.h"
#include "Cpu.h"


/*
** ===================================================================
**     Method      :  Motorstep_GetVal (component BitsIO)
**     Description :
**         This method returns an input value.
**           a) direction = Input  : reads the input value from the
**                                   pins and returns it
**           b) direction = Output : returns the last written value
**     Parameters  : None
**     Returns     :
**         ---        - Input value (0 to 15)
** ===================================================================
*/
byte Motorstep_GetVal(void);

/*
** ===================================================================
**     Method      :  Motorstep_PutVal (component BitsIO)
**     Description :
**         This method writes the new output value.
**           a) direction = Input  : sets the new output value;
**                                   this operation will be shown on
**                                   output after the direction has
**                                   been switched to output
**                                   (SetDir(TRUE);)
**           b) direction = Output : directly writes the value to the
**                                   appropriate pins
**     Parameters  :
**         NAME       - DESCRIPTION
**         Val        - Output value (0 to 15)
**     Returns     : Nothing
** ===================================================================
*/
void Motorstep_PutVal(byte Val);

/*
** ===================================================================
**     Method      :  Motorstep_GetBit (component BitsIO)
**     Description :
**         This method returns the specified bit of the input value.
**           a) direction = Input  : reads the input value from pins
**                                   and returns the specified bit
**           b) direction = Output : returns the specified bit
**                                   of the last written value
**     Parameters  :
**         NAME       - DESCRIPTION
**         Bit        - Number of the bit to read (0 to 3)
**     Returns     :
**         ---        - Value of the specified bit (FALSE or TRUE)
**                      FALSE = "0" or "Low", TRUE = "1" or "High"
** ===================================================================
*/
bool Motorstep_GetBit(byte Bit);

/*
** ===================================================================
**     Method      :  Motorstep_PutBit (component BitsIO)
**     Description :
**         This method writes the new value to the specified bit
**         of the output value.
**           a) direction = Input  : sets the value of the specified
**                                   bit; this operation will be
**                                   shown on output after the
**                                   direction has been switched to
**                                   output (SetDir(TRUE);)
**           b) direction = Output : directly writes the value of the
**                                   bit to the appropriate pin
**     Parameters  :
**         NAME       - DESCRIPTION
**         Bit        - Number of the bit (0 to 3)
**         Val        - New value of the bit (FALSE or TRUE)
**                      FALSE = "0" or "Low", TRUE = "1" or "High"
**     Returns     : Nothing
** ===================================================================
*/
void Motorstep_PutBit(byte Bit, bool Val);

/*
** ===================================================================
**     Method      :  Motorstep_ClrBit (component BitsIO)
**     Description :
**         This method clears (sets to zero) the specified bit
**         of the output value.
**         [ It is the same as "PutBit(Bit,FALSE);" ]
**           a) direction = Input  : sets the specified bit to "0";
**                                   this operation will be shown on
**                                   output after the direction has
**                                   beenswitched to output
**                                   (SetDir(TRUE);)
**           b) direction = Output : directly writes "0" to the
**                                   appropriate pin
**     Parameters  :
**         NAME       - DESCRIPTION
**         Bit        - Number of the bit to clear (0 to 3)
**     Returns     : Nothing
** ===================================================================
*/
void Motorstep_ClrBit(byte Bit);

/*
** ===================================================================
**     Method      :  Motorstep_SetBit (component BitsIO)
**     Description :
**         This method sets (sets to one) the specified bit of the
**         output value.
**         [ It is the same as "PutBit(Bit,TRUE);" ]
**           a) direction = Input  : sets the specified bit to "1";
**                                   this operation will be shown on
**                                   output after the direction has
**                                   been switched to output
**                                   (SetDir(TRUE);)
**           b) direction = Output : directly writes "1" to the
**                                   appropriate pin
**     Parameters  :
**         NAME       - DESCRIPTION
**         Bit        - Number of the bit to set (0 to 3)
**     Returns     : Nothing
** ===================================================================
*/
void Motorstep_SetBit(byte Bit);

/*
** ===================================================================
**     Method      :  Motorstep_NegBit (component BitsIO)
**     Description :
**         This method negates (inverts) the specified bit of the
**         output value.
**           a) direction = Input  : inverts the specified bit;
**                                   this operation will be shown on
**                                   output after the direction has
**                                   been switched to output
**                                   (SetDir(TRUE);)
**           b) direction = Output : directly inverts the value
**                                   of the appropriate pin
**     Parameters  :
**         NAME       - DESCRIPTION
**         Bit        - Number of the bit to invert (0 to 31)
**     Returns     : Nothing
** ===================================================================
*/
void Motorstep_NegBit(byte Bit);

/*
** ===================================================================
**     Method      :  Motorstep_GetDir (component BitsIO)
**     Description :
**         This method returns direction of the component.
**     Parameters  : None
**     Returns     :
**         ---        - Direction of the component (<false> or <true>)
**                      <false> = Input, <true> = Output
** ===================================================================
*/
#define Motorstep_GetDir() ( \
    (bool)((getReg8(PTDDD) & 0x10U))   /* Return pin direction, 0==GPI, nonzero==GPO */ \
  )

/*
** ===================================================================
**     Method      :  Motorstep_SetDir (component BitsIO)
**     Description :
**         This method sets direction of the component.
**     Parameters  :
**         NAME       - DESCRIPTION
**         Dir        - Direction to set (FALSE or TRUE)
**                      FALSE = Input, TRUE = Output
**     Returns     : Nothing
** ===================================================================
*/
void Motorstep_SetDir(bool Dir);



/* END Motorstep. */
#endif /* #ifndef __Motorstep_H_ */
/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.3 [05.09]
**     for the Freescale HCS08 series of microcontrollers.
**
** ###################################################################
*/
