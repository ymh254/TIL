# Lombok

: Java에서 Getter, Setter, 기본생성자, toString 등을 annotation으로 자동 생성해주는 라이브러리.

=> @Getter, @Setter 같은 annotation 기반으로 기존 DTO, VO, Domain Class작성할 때 멤버 변수에 대한 Getter/Setter Method, Equals(), hashCode(), toString()과 멤버 변수에 값을 설정하는 생성자 등을 자동으로 생성해줌.

Ex) < Lombok을 사용하지 않은 코드 >

```
public class BasicSampel {
    private Integer id;
    private String name;

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

     public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof LombokSampel)) return false;

        LombokSampel that = (LombokSampel) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        return name != null ? name.equals(that.name) : that.name == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
```

< Lombok을 사용한 코드 >

```
import lombok.Data;
import lombok.Setter;
import lombok.EqualsAndHashCode;

@Data
public class LombokSampel {
    private Integer id;
    private String name;
}
```

=> 같은 기능의 코드임에도 복잡하고 반복되는 코드의 양이 현저히 줄어듦으로서 가독성과 생산성을 높혀줌.

=> @Data = @Getter + @Setter + @RequiredArgsConstructor + @ToString + @EqualsAndHashCode



!! 몇 몇 어노테이션으로 자동생성되는 메서드에의해 순환참조 또는 무한 재귀 호출 문제 에러가 발생할 수 있음을 유의해야함 !!

