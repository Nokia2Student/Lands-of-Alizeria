// tgui/packages/tgui/interfaces/YourInterface.tsx
import { Button, Stack } from 'tgui-core/components';
import { Window } from '../layouts';
import { useBackend } from '../backend';
import './YourInterface.scss';


export const YourInterface = (props, context) => {
	const { act, data } = useBackend();
	const { categories = [], selected_category } = data;

	return (
		<Window title="Категории" width={400} height={300}>
			<Window.Content>
				<Stack vertical>
					<Stack.Item>
						<div className="category-buttons-container">
							{categories.map((category) => (
								<button
									key={category}
									className={`category-button ${
										selected_category === category ? 'active' : ''
									}`}
									onClick={() => act('select_category', { category })}
									aria-pressed={selected_category === category}
								>
									{category}
								</button>
							))}
						</div>
					</Stack.Item>
				</Stack>
			</Window.Content>
		</Window>
	);
};