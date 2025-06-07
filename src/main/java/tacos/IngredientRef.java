package tacos;

import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@NoArgsConstructor
public class IngredientRef {

    private String ingredient;
    public IngredientRef(String ingredientId) {
        this.ingredient = ingredientId;
    }

}