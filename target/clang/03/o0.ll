; ModuleID = '../sources/clang/03.c'
source_filename = "../sources/clang/03.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local global i32 16, align 4
@array1 = dso_local global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local global i8 0, align 1
@array2 = common dso_local global [131072 x i8] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @leakByteNoinlineFunction(i8 zeroext) #0 {
  %2 = alloca i8, align 1
  store i8 %0, i8* %2, align 1
  %3 = load i8, i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = mul nsw i32 %4, 512
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %6
  %8 = load i8, i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = load i8, i8* @temp, align 1
  %11 = zext i8 %10 to i32
  %12 = and i32 %11, %9
  %13 = trunc i32 %12 to i8
  store i8 %13, i8* @temp, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @victim_function_v03(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = load i32, i32* @array1_size, align 4
  %5 = zext i32 %4 to i64
  %6 = icmp ult i64 %3, %5
  br i1 %6, label %7, label %11

; <label>:7:                                      ; preds = %1
  %8 = load i64, i64* %2, align 8
  %9 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %8
  %10 = load i8, i8* %9, align 1
  call void @leakByteNoinlineFunction(i8 zeroext %10)
  br label %11

; <label>:11:                                     ; preds = %7, %1
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
